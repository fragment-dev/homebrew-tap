require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3279.0.0-darwin-x64.tar.gz"
    sha256 "c0e622b06ca35f8c5b784ba3901ebe09c272588b89f62e0cb3a25a33a34df7eb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3279.0.0-darwin-arm64.tar.gz"
      sha256 "5ec6952f79f3239d1e33c6c1f7027850b46d81d9b73ba3b4205a270ef99aa6f6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3279.0.0-linux-x64.tar.gz"
    sha256 "c804c788064a4fd5a06e10d0ed5ffa6247a8b6dc75a457b8ca147284234f1959"
  end
  version "3279.0.0"
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
