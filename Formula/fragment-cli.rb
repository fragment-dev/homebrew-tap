require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.30-darwin-x64.tar.gz"
    sha256 "a17cb3b71b57da0fe0b6ea5c552605dacc79ad6e2cd5145f812b35b0f6bb35f5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.30-darwin-arm64.tar.gz"
      sha256 "579e1902f0922b9753e74c241c4b842648afb041dec9bc58cc5781c1620a2d89"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.30-linux-x64.tar.gz"
    sha256 "88137ba51c13b072c2019849429c8464972e718d192e40f29370430f92d3a658"
  end
  version "2023.3.30"
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
