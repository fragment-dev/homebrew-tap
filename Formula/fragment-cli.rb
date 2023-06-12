require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.12-darwin-x64.tar.gz"
    sha256 "a3d6ac4914af79d72510da9c31bbd616c50389d734a667af01822e4127590bbd"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.12-darwin-arm64.tar.gz"
      sha256 "fc5bb6f890e1e7328be9928938e54576193b77e28d414dd140a11dc2cd7495a4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.12-linux-x64.tar.gz"
    sha256 "2e5aaa64a6bccc2b241ae19f0426ec6a19dfeec30d8f0edaaca5ccb0774048b8"
  end
  version "2023.6.12"
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
