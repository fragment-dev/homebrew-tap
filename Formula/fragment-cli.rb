require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.27-darwin-x64.tar.gz"
    sha256 "9bab5e08010a9f1194bec220ee3de5ba91ad38311234d05b553484af01288c7e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.27-darwin-arm64.tar.gz"
      sha256 "0a954ec3db6b5c29e25722a939ab79a0669995bd8b72c5439dba33593c60aa72"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.27-linux-x64.tar.gz"
    sha256 "28ca1ffb2e9e8ea519f2334685a48f774d6e27d5cbedb8e7e22677fbae0024d9"
  end
  version "2023.3.27"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
