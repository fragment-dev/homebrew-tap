require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2526.0.0-darwin-x64.tar.gz"
    sha256 "41d36990feca66c4396e0907daf52f29085218822498595ca1877863f5856c25"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2526.0.0-darwin-arm64.tar.gz"
      sha256 "36e7a9eb812c7925a7174135cb034768119b73a20f9db04dfae495c89816b60c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2526.0.0-linux-x64.tar.gz"
    sha256 "4123b602a3127f3c0fdc283bf7e0e10c54ce4fb9942d8132decf6bf441e13869"
  end
  version "2526.0.0"
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
