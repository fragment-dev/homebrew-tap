require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3341.0.0-darwin-x64.tar.gz"
    sha256 "e9bce2fefaa4eaf8a16a8c7e76fd9001fee03453f801981503a9c41f41ba7f32"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3341.0.0-darwin-arm64.tar.gz"
      sha256 "a831e0e9b3942856e54cda4ef7d1f9b4ea9f5f9256fa72f8a5a5f27c6d8e8fa8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3341.0.0-linux-x64.tar.gz"
    sha256 "2dd7150cb075560ada0d527cd9cc7b0575a0cc7b526257cc904ba4459a187710"
  end
  version "3341.0.0"
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
