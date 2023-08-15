require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.15-1-darwin-x64.tar.gz"
    sha256 "309a97c0e5b0880b9697eff72ce3eb3a29a8828efff5a8fc03a2b2c13114447b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.15-1-darwin-arm64.tar.gz"
      sha256 "c87893da3d2674b894953ffb615bf57a06e5905e8510df7f52ed0cc0df6b0eea"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.15-1-linux-x64.tar.gz"
    sha256 "228f13ee411e672c2d974690290bdb1d285feecb2e10200ab84e160dfd43e285"
  end
  version "2023.8.15-1"
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
