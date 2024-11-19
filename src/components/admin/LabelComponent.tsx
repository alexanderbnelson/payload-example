// Define the component using the explicit props type
const LabelComponent: React.FC<any> = ({data}: {data: any}) => {

  console.log("data", data);



  return (
    <div className="flex items-center">
      {data.text || "Custom Label"}
    </div>
  );
};

export default LabelComponent;
