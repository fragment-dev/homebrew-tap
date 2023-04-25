require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.25-1-darwin-x64.tar.gz"
    sha256 "b033627a00c072672d84907f3c97f7ad0165fc70f37b29a698316bc188748221"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.25-1-darwin-arm64.tar.gz"
      sha256 "62d39e43962e54d3cc7eef55469b1864b3d1de86dab4f7d007b2058e473e2eed"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.25-1-linux-x64.tar.gz"
    sha256 "731bbef9e0ca9a40396e65f76c0bc6a70518eb3d81fd745937058c3c54dd167b"
  end
  version "2023.4.25-1"
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
