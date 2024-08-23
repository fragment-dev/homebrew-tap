require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.23-darwin-x64.tar.gz"
    sha256 "87da6daada3802438eeddceb8ddadcce38e87c67c5d57ae35e587b5d44936e02"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.23-darwin-arm64.tar.gz"
      sha256 "cd7d20cad09ab633909b305be9148b8f18aecfa2a938b3f1e5710cee02194d17"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.23-linux-x64.tar.gz"
    sha256 "548942a59bd5046e43f7c14515f49d00c495be59e9c18bc9daafe047032f7118"
  end
  version "2024.8.23"
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
