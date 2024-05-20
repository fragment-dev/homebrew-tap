require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5089.0.0-darwin-x64.tar.gz"
    sha256 "f04d20fbdd185fd22aba3ccbbaf38d5ad9b912e7bcc8f9d82a7a24d13aadda19"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5089.0.0-darwin-arm64.tar.gz"
      sha256 "7e835bc4b95620429b16987de0220f3db83b04b842324a1ce8849e566d3e0cff"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5089.0.0-linux-x64.tar.gz"
    sha256 "1fd45b756262ce47102cb636fcb6298580751f786f232277b31f819243cafc5a"
  end
  version "5089.0.0"
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
