require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5900.0.0-darwin-x64.tar.gz"
    sha256 "ab5e8057ae3c62085bbcb35f91660e24d5976eb508b489181e8f48d87127c109"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5900.0.0-darwin-arm64.tar.gz"
      sha256 "d363d4981bc47bd4c5b127d6e6bb4409c139208514a2556ab5c836affd9ea532"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5900.0.0-linux-x64.tar.gz"
    sha256 "6ac4c70dce05c68dc1e0becc3f2496fe931df510af3d365dd58502aee34a44a4"
  end
  version "5900.0.0"
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
