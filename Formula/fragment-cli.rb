require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.4-2-darwin-x64.tar.gz"
    sha256 "28e507c4a41e4b22cd10f3045c0c3e0c13a1e056fd0544ac85526dc1e207f15c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.4-2-darwin-arm64.tar.gz"
      sha256 "e608e5d55c44f4b9d3b9d9615e0e15f798f12a89ec4a93090517b7cb08020422"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.4-2-linux-x64.tar.gz"
    sha256 "fa6438b5d18b3db298deb542aad7165bd05a32c479f86bdaed790e1c49b3f289"
  end
  version "2024.1.4-2"
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
