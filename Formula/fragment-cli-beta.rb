require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5515.0.0-darwin-x64.tar.gz"
    sha256 "ff8f3abcf67d97fd7cf5c4ab9a7d2ac8185b158cfd79a026f42d65778ac17a2f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5515.0.0-darwin-arm64.tar.gz"
      sha256 "b5eaf79f6e9ede9a6435d3006313517b7bb4a6e47eee37ab40235061c52421fb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5515.0.0-linux-x64.tar.gz"
    sha256 "9f5d0b0594995a3b5963c81481082b195b8d711230014f80f19cbd182f29ca40"
  end
  version "5515.0.0"
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
