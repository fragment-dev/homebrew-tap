require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4918.0.0-darwin-x64.tar.gz"
    sha256 "7d768766964ede979c2e788904d6a96abcad29a00228cdf3327534c175c032f5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4918.0.0-darwin-arm64.tar.gz"
      sha256 "7b4079b9f6f9455ce960d37957b464f9b60cdc3ae162f70d091cc42b8a1df3e5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4918.0.0-linux-x64.tar.gz"
    sha256 "f247173bfa4035fafe38bc8db515a0864535f02364f1f25d186278a805472f3b"
  end
  version "4918.0.0"
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
