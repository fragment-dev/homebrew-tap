require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.28-darwin-x64.tar.gz"
    sha256 "dcdb681977a385761788f445f380a0318d2e5140204b8c2bd51317d0bd0f9982"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.28-darwin-arm64.tar.gz"
      sha256 "49c2b28d18f2651e724634cc680fe655c8e130dfcf3e5e18153b7200d12b07c2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.3.28-linux-x64.tar.gz"
    sha256 "edf8d8e99713843f002254269484feec3d867ea31bd660abd46e52325d852fbf"
  end
  version "2023.3.28"
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
