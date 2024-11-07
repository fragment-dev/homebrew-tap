require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.7-darwin-x64.tar.gz"
    sha256 "a2bb1fd286bb88dc92bd3647d167a50f8b34ee37ed33b4e4309158911d3ff8b9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.7-darwin-arm64.tar.gz"
      sha256 "ec058a636046b7f2b36d615e876d66c5aa14002270941a2a1f81ffe3fab0a354"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.7-linux-x64.tar.gz"
    sha256 "439579082e001e4c9520297564dcb6c61cb34465745dae658ac4287f13500d91"
  end
  version "2024.11.7"
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
