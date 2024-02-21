require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.20-2-darwin-x64.tar.gz"
    sha256 "3d2f1784cb771d239feed38dc56f017dca6bd11a969aa057c7d6e9c113763801"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.20-2-darwin-arm64.tar.gz"
      sha256 "dfc412ae86287c8225e0a6fd49af85bfd5877b40de4f19b84eb339962ad158d9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.20-2-linux-x64.tar.gz"
    sha256 "1266a5627b08d4cdae78fadfbf851a1e1a8a102636508399adbcff1d24065788"
  end
  version "2024.2.20-2"
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
