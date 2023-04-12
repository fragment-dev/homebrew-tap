require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2423.0.0-darwin-x64.tar.gz"
    sha256 "91cfb7420266d663de43806b763fb300ce2fc1d7583716bb9358b7f6b13bc5b0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2423.0.0-darwin-arm64.tar.gz"
      sha256 "8a62986aff0fbf841fe6c039a4b3e36d579bd2cee5cc7235a96cbf65790857db"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2423.0.0-linux-x64.tar.gz"
    sha256 "5cccca0e27cdc47d514de3cb2ba8fe6bafc2eb6ac68a87db18fa7c6714c9f406"
  end
  version "2423.0.0"
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
