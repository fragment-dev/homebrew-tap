require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2403.0.0-darwin-x64.tar.gz"
    sha256 "25e7b3ccb45cb347046971d23b8b433d1259b3f86a683b96e77c34f1b7342e99"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2403.0.0-darwin-arm64.tar.gz"
      sha256 "7801ba4421a0e0b5a121204e2bd53d78cc4177bee613560a652472b298297db4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2403.0.0-linux-x64.tar.gz"
    sha256 "ace49fc08e4e5900c3cb81700aaf49d3a3b9b981a4565d92df15fa43f329ab29"
  end
  version "2403.0.0"
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
