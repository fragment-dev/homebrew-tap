require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3240.0.0-darwin-x64.tar.gz"
    sha256 "8774eaeb371a919a0d4ae45968390d723bfbce89a0e6f9aa66984e80e5eaa87c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3240.0.0-darwin-arm64.tar.gz"
      sha256 "49095317e32cddc8685dae8eefc844644f8174948bef8cfe659e6abe4a8ef7e4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3240.0.0-linux-x64.tar.gz"
    sha256 "03a29d18b2d33742641366f52a78440bd490594e87c3881771da7ce8aaa2dc03"
  end
  version "3240.0.0"
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
