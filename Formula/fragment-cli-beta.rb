require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5767.0.0-darwin-x64.tar.gz"
    sha256 "50fcf00275864bd5c6fd32c074d50cc44ee06cad0c5ab65f116fd93fbd60fafa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5767.0.0-darwin-arm64.tar.gz"
      sha256 "53c5f665359cb02d21c480c28cd6e805fdaf90edf29a0f8ec8fb00b675968080"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5767.0.0-linux-x64.tar.gz"
    sha256 "3ad08e1ebb368a567cb624acdbf64ec64ecd026c10751ae0ae0a7a997bcae290"
  end
  version "5767.0.0"
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
