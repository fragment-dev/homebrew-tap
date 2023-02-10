require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.10-darwin-x64.tar.gz"
    sha256 "9695727d9682cf7838bad25e66ca2089390053e9726f5314f5098fcf9e75bb21"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.10-darwin-arm64.tar.gz"
      sha256 "d9cb3d36722ea3445329e31334656fae23894f32cfd8ba328cfb30068d7bbe05"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.10-linux-x64.tar.gz"
    sha256 "bdabf92ae433d9bdfeed1d95cd8cdada6fb67a1a3f13494b5429ca727be70142"
  end
  version "2023.2.10"
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
