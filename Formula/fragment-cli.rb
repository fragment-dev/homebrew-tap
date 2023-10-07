require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.6-1-darwin-x64.tar.gz"
    sha256 "607267a32a1eb695125fa49f7ae398bb75b33f68ccfea3769cda27e11f8714d2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.6-1-darwin-arm64.tar.gz"
      sha256 "83f29b09329a8920b486e92d383983d65f17572644e2acacc8f1d8d023b6ed92"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.6-1-linux-x64.tar.gz"
    sha256 "89269d61c09c17e74b9c9eeb1a1ed33cf7633c86b23d8cf3fef7dd24a78bec2b"
  end
  version "2023.10.6-1"
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
