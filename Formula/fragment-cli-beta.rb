require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3350.0.0-darwin-x64.tar.gz"
    sha256 "8eb1085483b1f7d0be0c571c65bf09efa2d37632783804b230ff9b1e83effa3d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3350.0.0-darwin-arm64.tar.gz"
      sha256 "59dcaee1ebe4a4d82fb8f1fd2ed21e54916a319182bae77476f51cd38dfc44a1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3350.0.0-linux-x64.tar.gz"
    sha256 "1ab38e173d5e19c5c03e6a77c14b810ec40fab8d661af988c528ea23868ad20c"
  end
  version "3350.0.0"
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
