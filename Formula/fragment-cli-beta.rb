require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5465.0.0-darwin-x64.tar.gz"
    sha256 "723cdd8a65ff4d9358c18f0b0ec502e5b8f978ff3b816b00db10c02f389ca1eb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5465.0.0-darwin-arm64.tar.gz"
      sha256 "57ab3150aae696c114bb200e498929b39b5ceba94fee89965972de7b3488718c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5465.0.0-linux-x64.tar.gz"
    sha256 "0b8e205c39f45cffa2984c5808db4c7aa6914f60b7271983f928edd716dfd5ac"
  end
  version "5465.0.0"
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
