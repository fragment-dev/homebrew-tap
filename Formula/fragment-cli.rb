require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.16-1-darwin-x64.tar.gz"
    sha256 "3cf3e50aebe8d52313b36aba18d9e30ea136a21826deab38ac474b8021ebc4f4"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.16-1-darwin-arm64.tar.gz"
      sha256 "d4342f57713982b5423a8ace324ca490c95b6766f6181ed030b8dc16380614f2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.16-1-linux-x64.tar.gz"
    sha256 "83ec2273dc3994d35f74424206374054a41a4135f68cbfb67ad7e1512dabe518"
  end
  version "2025.1.16-1"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
