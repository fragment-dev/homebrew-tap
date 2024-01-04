require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4267.0.0-darwin-x64.tar.gz"
    sha256 "ce9c24a28fd01720e3c008c6667019eeea69ed9c31e027cc180f8a896577e596"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4267.0.0-darwin-arm64.tar.gz"
      sha256 "816329310f9576da8661f5244504d37192e47e10097011b9d20ffc693b557309"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4267.0.0-linux-x64.tar.gz"
    sha256 "a895c9f79f650cac6916434c11f414926ee75e791d19424ea3ae633f701f3be5"
  end
  version "4267.0.0"
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
