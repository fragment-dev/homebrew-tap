require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5633.0.0-darwin-x64.tar.gz"
    sha256 "6973ae197ab73fe942314f071b551ea7c1ab245aef7a076459fa3e0cee49516f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5633.0.0-darwin-arm64.tar.gz"
      sha256 "36a042df7bf75eea6a2ea3f35db05ffaac435c962950ece2715a49909da4e057"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5633.0.0-linux-x64.tar.gz"
    sha256 "704f395979af872a7c54552442a4944ec61d261a555f1577e82465823ed1081c"
  end
  version "5633.0.0"
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
