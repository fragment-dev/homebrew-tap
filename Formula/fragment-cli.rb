require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.25-darwin-x64.tar.gz"
    sha256 "976ffa2697663a58437cdddf706571036a339da423c7980d3e3c43366ac00511"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.25-darwin-arm64.tar.gz"
      sha256 "3748b69cd830d962ffafa4f463caeb8f86e81d29258351d494a9cd5a1a00aea9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.25-linux-x64.tar.gz"
    sha256 "110e188cb38f28d1a6ddec7f659e399429a1808e641c7f03c1fa28aef679d994"
  end
  version "2024.11.25"
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
