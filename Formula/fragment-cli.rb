require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.6-1-darwin-x64.tar.gz"
    sha256 "ba8dcd25cdb1fd630f9bd192080495494170d6331502c836da62d06655acbd08"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.6-1-darwin-arm64.tar.gz"
      sha256 "ee2739fc7bbe033722d6311e32f2fbe416c43640ff2974feaca1b75e3f0bf438"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.6-1-linux-x64.tar.gz"
    sha256 "a5263712617a46782d5760d490dfcb50bf87660c7438887e6241a8654d8d9952"
  end
  version "2024.6.6-1"
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
