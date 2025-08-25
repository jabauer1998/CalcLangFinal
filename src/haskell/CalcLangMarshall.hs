module CalcLangMarshall (marshallAstNode) where

import CalcLangAstH
import Foreign.Ptr
import Text.Parsec.Pos
import Foreign.Marshal.Alloc
import Foreign.C.String
import Foreign.Marshal.Array
import Foreign.Storable

-- First we need to make the SourcePos into a ctype Source Pos

marshallSourcePos :: SourcePos -> IO (Ptr CSourcePos)
marshallSourcePos a = do
                      let name  = sourceName a
                      cName <- newCString name
                      let line = sourceLine a
                      let col = sourceColumn a
                      ptr <- mallocBytes (sizeOf (undefined :: CSourcePos)) 
                      let g = (CSourcePos cName (fromIntegral line) (fromIntegral col))
                      poke ptr g
                      return ptr

--Next we need to marshall the StoreArray

marshallStorageArray :: SA -> IO (Ptr CSA)
marshallStorageArray a = case a of
                           StoreArray s l -> do
                                             ptr <- mallocBytes (sizeOf (undefined :: CSA))
                                             list <- mapM marshallAstNode l
                                             let g = (CStoreArray (fromIntegral s) list)
                                             poke ptr g
                                             return ptr

-- Now we need to marshal Ast Nodes

marshallAstNode :: AstNode -> IO (Ptr CAstNode)
marshallAstNode a = case a of
                      EqualOperation pos x y -> do
                                                ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                                myPos <- (marshallSourcePos pos)
                                                left <- (marshallAstNode x)
                                                right <- (marshallAstNode y)
                                                let g = (CEqualOperation myPos left right)
                                                poke ptr g
                                                return ptr
                      LessThenOrEqualsOperation pos x y -> do
                                                           ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                                           myPos <- (marshallSourcePos pos)
                                                           left <- (marshallAstNode x)
                                                           right <- (marshallAstNode y)
                                                           let g = (CLessThenOrEqualsOperation myPos left right)
                                                           poke ptr g
                                                           return ptr
                      GreaterThenOrEqualsOperation pos x y -> do
                                                              ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                                              myPos <- (marshallSourcePos pos)
                                                              left <- (marshallAstNode x)
                                                              right <- (marshallAstNode y)
                                                              let g = (CGreaterThenOrEqualsOperation myPos left right)
                                                              poke ptr g
                                                              return ptr
                      LessThenOperation pos x y -> do
                                                   ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                                   myPos <- (marshallSourcePos pos)
                                                   left <- (marshallAstNode x)
                                                   right <- (marshallAstNode y)
                                                   let g = (CLessThenOperation myPos left right)
                                                   poke ptr g
                                                   return ptr
                      GreaterThenOperation pos x y -> do
                                                      ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                                      myPos <- (marshallSourcePos pos)
                                                      left <- (marshallAstNode x)
                                                      right <- (marshallAstNode y)
                                                      let g = (CGreaterThenOperation myPos left right)
                                                      poke ptr g
                                                      return ptr
                      AdditionOperation pos x y -> do
                                                   ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                                   myPos <- (marshallSourcePos pos)
                                                   left <- (marshallAstNode x)
                                                   right <- (marshallAstNode y)
                                                   let g = (CAdditionOperation myPos left right)
                                                   poke ptr g
                                                   return ptr
                      SubtractionOperation pos x y -> do
                                                      ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                                      myPos <- (marshallSourcePos pos)
                                                      left <- (marshallAstNode x)
                                                      right <- (marshallAstNode y)
                                                      let g = (CSubtractionOperation myPos left right)
                                                      poke ptr g
                                                      return ptr
                      MultiplicationOperation pos x y -> do
                                                         ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                                         myPos <- (marshallSourcePos pos)
                                                         left <- (marshallAstNode x)
                                                         right <- (marshallAstNode y)
                                                         let g = (CMultiplicationOperation myPos left right)
                                                         poke ptr g
                                                         return ptr
                      DivisionOperation pos x y -> do
                                                   ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                                   myPos <- (marshallSourcePos pos)
                                                   left <- (marshallAstNode x)
                                                   right <- (marshallAstNode y)
                                                   let g = (CDivisionOperation myPos left right)
                                                   poke ptr g
                                                   return ptr
                      PowerOperation pos x y -> do
                                                ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                                myPos <- (marshallSourcePos pos)
                                                left <- (marshallAstNode x)
                                                right <- (marshallAstNode y)
                                                let g = (CPowerOperation myPos left right)
                                                poke ptr g
                                                return ptr
                      IntNumberAst pos s -> do
                                            ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                            cStr <- (newCString s)
                                            myPos <- (marshallSourcePos pos)
                                            let g = (CIntNumberAst myPos cStr)
                                            poke ptr g
                                            return ptr
                      RealNumberAst pos s -> do
                                             ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                             cStr <- newCString s
                                             myPos <- (marshallSourcePos pos)
                                             let g = (CRealNumberAst myPos cStr)
                                             poke ptr g
                                             return ptr
                      BooleanAst pos s -> do
                                          ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                          cStr <- newCString s
                                          myPos <- (marshallSourcePos pos)
                                          let g = (CBooleanAst myPos cStr)
                                          poke ptr g
                                          return ptr
                      SetAst pos s -> do
                                      ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                      myPos <- marshallSourcePos pos
                                      arr <- marshallStorageArray s
                                      let g = (CSetAst myPos arr)
                                      poke ptr g
                                      return ptr
                      TupleAst pos s -> do
                                        ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                        myPos <- marshallSourcePos pos
                                        arr <- marshallStorageArray s
                                        let g = (CTupleAst myPos arr)
                                        poke ptr g
                                        return ptr
                      IdentAst pos c -> do
                                        ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                        myPos <- marshallSourcePos pos
                                        let myChar = (castCharToCChar c)
                                        let g = (CIdentAst myPos myChar)
                                        poke ptr g
                                        return ptr
                      DollarAst pos s -> do
                                         ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                         cStr <- newCString s
                                         myPos <- (marshallSourcePos pos)
                                         let g = (CDollarAst myPos cStr)
                                         poke ptr g
                                         return ptr
                      PercentAst pos s -> do
                                          ptr <- mallocBytes (sizeOf (undefined :: CAstNode))
                                          cStr <- newCString s
                                          myPos <- (marshallSourcePos pos)
                                          let g = (CPercentAst myPos cStr)
                                          poke ptr g
                                          return ptr
                      FunctionCall pos name args -> do
                                                     ptr <- (mallocBytes (sizeOf (undefined :: CAstNode)))
                                                     myPos <- (marshallSourcePos pos)
                                                     let cName = (castCharToCChar name)
                                                     myArgs <- marshallStorageArray args
                                                     let g = (CFunctionCall myPos cName myArgs)
                                                     poke ptr g
                                                     return ptr
                      NegateOperation pos astNode -> do
                                                     ptr <- (mallocBytes (sizeOf (undefined :: CAstNode)))
                                                     myPos <- marshallSourcePos pos
                                                     myExpr <- marshallAstNode astNode
                                                     let g = (CNegateOperation myPos myExpr)
                                                     poke ptr g
                                                     return ptr
                      NotOperation pos astNode -> do
                                                  ptr <- (mallocBytes (sizeOf (undefined :: CAstNode)))
                                                  myPos <- marshallSourcePos pos
                                                  myExpr <- marshallAstNode astNode
                                                  let g = (CNotOperation myPos myExpr)
                                                  poke ptr g
                                                  return ptr
                      FunctionDef pos name args expr -> do
                                                        ptr <- (mallocBytes (sizeOf (undefined :: CAstNode)))
                                                        myPos <- marshallSourcePos pos
                                                        let myName = (castCharToCChar name)
                                                        myArgs <- (marshallStorageArray args)
                                                        myExpr <- (marshallAstNode expr)
                                                        let g = (CFunctionDef myPos myName myArgs myExpr)
                                                        poke ptr g
                                                        return ptr
                      Assign pos name expr -> do
                                              ptr <- (mallocBytes (sizeOf (undefined :: CAstNode)))
                                              myPos <- marshallSourcePos pos
                                              let myName = (castCharToCChar name)
                                              myExpr <- (marshallAstNode expr)
                                              let g = (CAssign myPos myName myExpr)
                                              poke ptr g
                                              return ptr
                      IfExpr pos cond ifTrue ifFalse -> do
                                                        ptr <- (mallocBytes (sizeOf (undefined :: CAstNode)))
                                                        myPos <- marshallSourcePos pos
                                                        myCond <- marshallAstNode cond
                                                        left <- marshallAstNode ifTrue
                                                        right <- marshallAstNode ifFalse
                                                        let g = (CIfExpr myPos myCond left right)
                                                        poke ptr g
                                                        return ptr
                      _ -> error "Invalid AstNode type"
                                                     
                       
                                        
                                      
                      
                      
                      
                              
                      

         
                      
                      
                                                 
                                                 
                      
                      

