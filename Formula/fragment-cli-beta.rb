require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3971.0.0-darwin-x64.tar.gz"
    sha256 "eafc875a0d15b8671aef7b2a7bb3c4a6c49fdfbcbde5ca3646211c252292016d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3971.0.0-darwin-arm64.tar.gz"
      sha256 "fe9c2f79c9d68568186ca1cff1d422ed7a3aa8ea03d96e256e7d0630e222ca4e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3971.0.0-linux-x64.tar.gz"
    sha256 "9447a1eefe9259b59ab6ba401688436c3a3b7be9fd30a4ebe0a3908b9296905a"
  end
  version "3971.0.0"
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
