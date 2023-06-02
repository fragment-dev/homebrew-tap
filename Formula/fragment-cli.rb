require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.2-1-darwin-x64.tar.gz"
    sha256 "2ddc95ff85117cbb63afa15e11a1cd8dcb19f8d3da43570d7806099d39a9447c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.2-1-darwin-arm64.tar.gz"
      sha256 "f1e3517cf6ae29a95acbe0269e1940923cb16daf57f088ee0fa2db430607bc5b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.2-1-linux-x64.tar.gz"
    sha256 "dd6be7d3242511960e0d257d40678c4300db8a2578129b85e8313fb2c529a60d"
  end
  version "2023.6.2-1"
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
