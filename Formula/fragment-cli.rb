require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.9-darwin-x64.tar.gz"
    sha256 "39c0fa05edf2201deee25783382132831153845e446aec36207db592ac6d8a99"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.9-darwin-arm64.tar.gz"
      sha256 "ba5117c1e606cc2d0f5145ebb32c5db06a76fd97454d2299e1f437b405692324"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.9-linux-x64.tar.gz"
    sha256 "221766c790dc53cead7e9cddd1dd0244c4353ae004d0dd6fdf38c5fdd1a6c0e8"
  end
  version "2025.1.9"
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
