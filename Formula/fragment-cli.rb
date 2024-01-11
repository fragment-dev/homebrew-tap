require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.10-1-darwin-x64.tar.gz"
    sha256 "07ae68e755e9507b982e1edf0d67f60facc1f9e94010e1579d9c448bd0fa5667"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.10-1-darwin-arm64.tar.gz"
      sha256 "c71df3aa3c5fb27ee6d8dfecb1c942e1f32d225d8388e5c7f60399cd0ea030cd"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.10-1-linux-x64.tar.gz"
    sha256 "7f7672298996e3a405acae67e25383027f9e4c0f30df342fae2830da981362eb"
  end
  version "2024.1.10-1"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
