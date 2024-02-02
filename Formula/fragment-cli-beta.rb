require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4487.0.0-darwin-x64.tar.gz"
    sha256 "a5141515b91a3070fce39e3cd1fef506f92d7f012be786b8d62f008653142898"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4487.0.0-darwin-arm64.tar.gz"
      sha256 "bce65ecc8c95a648e1a040081ddbcddcd715b9477877a617806c6e7cbdd675c3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4487.0.0-linux-x64.tar.gz"
    sha256 "77a171eb0bacb34e97476af66a2aafdf43816b42467768130fd3c2c76a89c8c9"
  end
  version "4487.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
