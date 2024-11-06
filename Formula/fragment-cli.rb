require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.6-1-darwin-x64.tar.gz"
    sha256 "2b865cb398ade9d1cfd03ee594c7573b62165c2e4016fcde554493588e53e475"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.6-1-darwin-arm64.tar.gz"
      sha256 "c28b746b0539acc07d2c57714a4d007928ee6accb95aee61cb11b8e5606e03b6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.6-1-linux-x64.tar.gz"
    sha256 "0d5079bad5569d0ab78b22b7753eae890f8fc830829b03f3234d8dd3459c1d41"
  end
  version "2024.11.6-1"
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
