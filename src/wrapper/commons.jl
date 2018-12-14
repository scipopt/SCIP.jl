# Automatically generated using Clang.jl wrap_c, version 0.0.0


# Skipping MacroDefinition: SCIPallocMemory ( scip , ptr ) ( ( BMSallocMemory ( ( ptr ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocMemoryArray ( scip , ptr , num ) ( ( BMSallocMemoryArray ( ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocClearMemoryArray ( scip , ptr , num ) ( ( BMSallocClearMemoryArray ( ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocMemorySize ( scip , ptr , size ) ( ( BMSallocMemorySize ( ( ptr ) , ( size ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPreallocMemoryArray ( scip , ptr , newnum ) ( ( BMSreallocMemoryArray ( ( ptr ) , ( newnum ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPreallocMemorySize ( scip , ptr , newsize ) ( ( BMSreallocMemorySize ( ( ptr ) , ( newsize ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPduplicateMemory ( scip , ptr , source ) ( ( BMSduplicateMemory ( ( ptr ) , ( source ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPduplicateMemoryArray ( scip , ptr , source , num ) ( ( BMSduplicateMemoryArray ( ( ptr ) , ( source ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPfreeMemory ( scip , ptr ) BMSfreeMemory ( ptr ) #
# Skipping MacroDefinition: SCIPfreeMemoryNull ( scip , ptr ) BMSfreeMemoryNull ( ptr ) #
# Skipping MacroDefinition: SCIPfreeMemoryArray ( scip , ptr ) BMSfreeMemoryArray ( ptr ) #
# Skipping MacroDefinition: SCIPfreeMemoryArrayNull ( scip , ptr ) BMSfreeMemoryArrayNull ( ptr ) #
# Skipping MacroDefinition: SCIPfreeMemorySize ( scip , ptr ) BMSfreeMemorySize ( ptr ) #
# Skipping MacroDefinition: SCIPfreeMemorySizeNull ( scip , ptr ) BMSfreeMemorySizeNull ( ptr ) /* Block Memory Management Macros
# *
# */
# Skipping MacroDefinition: SCIPallocBlockMemory ( scip , ptr ) ( ( BMSallocBlockMemory ( SCIPblkmem ( scip ) , ( ptr ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocBlockMemoryArray ( scip , ptr , num ) ( ( BMSallocBlockMemoryArray ( SCIPblkmem ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocBlockMemorySize ( scip , ptr , size ) ( ( BMSallocBlockMemorySize ( SCIPblkmem ( scip ) , ( ptr ) , ( size ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocClearBlockMemoryArray ( scip , ptr , num ) ( ( BMSallocClearBlockMemoryArray ( SCIPblkmem ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPreallocBlockMemoryArray ( scip , ptr , oldnum , newnum ) ( ( BMSreallocBlockMemoryArray ( SCIPblkmem ( scip ) , ( ptr ) , ( oldnum ) , ( newnum ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPreallocBlockMemorySize ( scip , ptr , oldsize , newsize ) ( ( BMSreallocBlockMemorySize ( SCIPblkmem ( scip ) , ( ptr ) , ( oldsize ) , ( newsize ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPduplicateBlockMemory ( scip , ptr , source ) ( ( BMSduplicateBlockMemory ( SCIPblkmem ( scip ) , ( ptr ) , ( source ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPduplicateBlockMemoryArray ( scip , ptr , source , num ) ( ( BMSduplicateBlockMemoryArray ( SCIPblkmem ( scip ) , ( ptr ) , ( source ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPensureBlockMemoryArray ( scip , ptr , arraysizeptr , minsize ) ( ( SCIPensureBlockMemoryArray_call ( ( scip ) , ( void * * ) ( ptr ) , sizeof ( * * ( ptr ) ) , ( arraysizeptr ) , ( minsize ) ) ) ) #
# Skipping MacroDefinition: SCIPfreeBlockMemory ( scip , ptr ) BMSfreeBlockMemory ( SCIPblkmem ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeBlockMemoryNull ( scip , ptr ) BMSfreeBlockMemoryNull ( SCIPblkmem ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeBlockMemoryArray ( scip , ptr , num ) BMSfreeBlockMemoryArray ( SCIPblkmem ( scip ) , ( ptr ) , ( num ) ) #
# Skipping MacroDefinition: SCIPfreeBlockMemoryArrayNull ( scip , ptr , num ) BMSfreeBlockMemoryArrayNull ( SCIPblkmem ( scip ) , ( ptr ) , ( num ) ) #
# Skipping MacroDefinition: SCIPfreeBlockMemorySize ( scip , ptr , size ) BMSfreeBlockMemorySize ( SCIPblkmem ( scip ) , ( ptr ) , ( size ) ) #
# Skipping MacroDefinition: SCIPfreeBlockMemorySizeNull ( scip , ptr , size ) BMSfreeBlockMemorySizeNull ( SCIPblkmem ( scip ) , ( ptr ) , ( size ) ) /* Buffer Memory Management Macros
# *
# *
# */
# Skipping MacroDefinition: SCIPallocBuffer ( scip , ptr ) ( ( BMSallocBufferMemory ( SCIPbuffer ( scip ) , ( ptr ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocBufferArray ( scip , ptr , num ) ( ( BMSallocBufferMemoryArray ( SCIPbuffer ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocClearBufferArray ( scip , ptr , num ) ( ( BMSallocClearBufferMemoryArray ( SCIPbuffer ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPreallocBufferArray ( scip , ptr , num ) ( ( BMSreallocBufferMemoryArray ( SCIPbuffer ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPduplicateBuffer ( scip , ptr , source ) ( ( BMSduplicateBufferMemory ( SCIPbuffer ( scip ) , ( ptr ) , ( source ) , ( size_t ) sizeof ( * * ( ptr ) ) ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPduplicateBufferArray ( scip , ptr , source , num ) ( ( BMSduplicateBufferMemoryArray ( SCIPbuffer ( scip ) , ( ptr ) , ( source ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPfreeBuffer ( scip , ptr ) BMSfreeBufferMemorySize ( SCIPbuffer ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeBufferNull ( scip , ptr ) BMSfreeBufferMemoryNull ( SCIPbuffer ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeBufferArray ( scip , ptr ) BMSfreeBufferMemoryArray ( SCIPbuffer ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeBufferArrayNull ( scip , ptr ) BMSfreeBufferMemoryArrayNull ( SCIPbuffer ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPallocCleanBuffer ( scip , ptr ) ( ( BMSallocBufferMemory ( SCIPcleanbuffer ( scip ) , ( ptr ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPallocCleanBufferArray ( scip , ptr , num ) ( ( BMSallocBufferMemoryArray ( SCIPcleanbuffer ( scip ) , ( ptr ) , ( num ) ) == NULL ) ? SCIP_NOMEMORY : SCIP_OKAY ) #
# Skipping MacroDefinition: SCIPfreeCleanBuffer ( scip , ptr ) BMSfreeBufferMemorySize ( SCIPcleanbuffer ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeCleanBufferNull ( scip , ptr ) BMSfreeBufferMemoryNull ( SCIPcleanbuffer ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeCleanBufferArray ( scip , ptr ) BMSfreeBufferMemoryArray ( SCIPcleanbuffer ( scip ) , ( ptr ) ) #
# Skipping MacroDefinition: SCIPfreeCleanBufferArrayNull ( scip , ptr ) BMSfreeBufferMemoryArrayNull ( SCIPcleanbuffer ( scip ) , ( ptr ) ) /* Memory Management Functions
# *
# *
# */
# Skipping MacroDefinition: SCIPdebugMsg ( scip , ... ) while ( FALSE ) SCIPprintDebugMessage ( scip , __FILE__ , __LINE__ , __VA_ARGS__ ) #
# Skipping MacroDefinition: SCIPdebugMsgPrint ( scip , ... ) while ( FALSE ) SCIPdebugMessagePrint ( scip , __VA_ARGS__ ) #
