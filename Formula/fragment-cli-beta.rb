require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4311.0.0-darwin-x64.tar.gz"
    sha256 "80d888f7114d3d11e5445689d0700fc06bac243cab3ac24111274522574179ab"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4311.0.0-darwin-arm64.tar.gz"
      sha256 "adcbbcb3e136b425ecb5f5c41995f084b49626cac6860c64149e87fa04eddbf7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4311.0.0-linux-x64.tar.gz"
    sha256 "30e1a7681e25c48b8acf9967e273326603fc6f55febc214ef2d9de02e5ce4603"
  end
  version "4311.0.0"
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
