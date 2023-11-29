require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.28-darwin-x64.tar.gz"
    sha256 "114ec86c944d3a3710e9505c9a0ff3c3b644f66ea2e2e6b4ab569f4eb4aa557f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.28-darwin-arm64.tar.gz"
      sha256 "5aa91b1fa750be7682153d42664b2d5cb1259e3f4a719e7506526e03f25e384d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.11.28-linux-x64.tar.gz"
    sha256 "8fb656518a04147050b94f2d808d53d262df7e2a4f542cd741f924394234c7b9"
  end
  version "2023.11.28"
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
