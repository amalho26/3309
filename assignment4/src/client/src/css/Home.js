import styled from 'styled-components';
import Image from '../images/police.jpeg';

export const Section = styled.section`
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0 30px;
    height: 100vh;
    position: relative;
    z-index: 1;

    :before{
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: linear-gradient(180deg, rgba(0,0,0,0.2) 0%, rgba(0,0,0,0.6) 100%),
        linear-gradient(180deg, rgba(0,0,0,0.2) 0%, transparent 100%);
        z-index: 2;
    }
`;

export const HeroBg = styled.div`
    width: 100%;
    padding: 20px;
    align-items: center;
`;
export const ImageBg = styled.div`
    
    background-image: url(${Image});
    width: 100%;
    height: 100%;
    
}
`;

export const HeroContent = styled.div`
    z-index: 3;
    max-width: 1200px;
    position: absolute;
    padding: 8px 24px;
    display: flex;
    flex-direction: column;
    align-items: center;
`;

export const SectionText = styled.h1`
    color: #fff;
    font-size: 52px;
    text-align: center;
`;