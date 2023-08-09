require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.9-darwin-x64.tar.gz"
    sha256 "c1c78031160945883423224c089ac0693c26bff15e6b9e6f9d4450e6d1a8cbda"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.9-darwin-arm64.tar.gz"
      sha256 "9d0592bccad4e5ceb60bd7ebd2f338938b8bbbdee313cb7423f1078e09334ca6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.9-linux-x64.tar.gz"
    sha256 "2f6fd3681cb6cc724eb754a8b734211350949eba8a3a54a41dabaed1fdc65e34"
  end
  version "2023.8.9"
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
