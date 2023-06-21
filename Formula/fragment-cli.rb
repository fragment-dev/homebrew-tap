require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.21-darwin-x64.tar.gz"
    sha256 "6ea200115d6f238c23d420f99005ffb6a8f02717e08b41f528d82a2da906fdda"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.21-darwin-arm64.tar.gz"
      sha256 "e8bc743e9f2f2dcaffe64eed3b856fbd51b3001f68737d458b052063d80febc4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.21-linux-x64.tar.gz"
    sha256 "9fddf2cb5f25503844876e0f1460918fcc0e885c0cc4d6baff6f9ba7f322841a"
  end
  version "2023.6.21"
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
