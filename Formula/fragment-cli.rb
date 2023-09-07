require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.7-1-darwin-x64.tar.gz"
    sha256 "e0032f31f172c63ce7722174421fa8a0fec7bed4e02b624eb7c0922f2af0eaf2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.7-1-darwin-arm64.tar.gz"
      sha256 "d725c357b520cdf3cdbbe0d288aec9faaa1f09d8d5f132289a373ce77e4a4d15"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.7-1-linux-x64.tar.gz"
    sha256 "fe689c6b08f0c45123226f885a271efe24fbd2904333bddb13a877bc7e17ad86"
  end
  version "2023.9.7-1"
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
