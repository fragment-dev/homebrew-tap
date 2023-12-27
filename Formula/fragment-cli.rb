require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.27-2-darwin-x64.tar.gz"
    sha256 "2faf9c96cc1620af433f9581d4def1b1f49cdb9dd0da1d3862428cac9fcf7592"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.27-2-darwin-arm64.tar.gz"
      sha256 "fa4f3f0cf6be55227ef8e26144c5ec2b99c205ad13e8a2bd387bc5801bb93685"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.27-2-linux-x64.tar.gz"
    sha256 "cd922dacf33c69f19c737a4770f4da543655840d6694f6158384424b9d560218"
  end
  version "2023.12.27-2"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
