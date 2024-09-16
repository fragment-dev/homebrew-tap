require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.14-darwin-x64.tar.gz"
    sha256 "dfc720b80caf4b55e77c17be9373e2d8016639cc0611cf2ba39e4a79f40eaec1"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.14-darwin-arm64.tar.gz"
      sha256 "13c56b3d8c5414995c1cc077ecc5bf59abf10406da69dda713552872e955c6d6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.14-linux-x64.tar.gz"
    sha256 "3a6a6be0a7c091505f11806cba858c90e82397ee0ac2542b1c8d4f1c13ea5f14"
  end
  version "2024.9.14"
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
