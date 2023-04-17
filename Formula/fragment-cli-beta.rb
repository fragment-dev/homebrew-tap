require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2448.0.0-darwin-x64.tar.gz"
    sha256 "ead8404227fa7a0a815dc3707fe7b341bbaac7a9c0e9ea1f27d23169c7717c18"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2448.0.0-darwin-arm64.tar.gz"
      sha256 "00365d8915efe6e8122cc36d4cf3c945bfdcda37621987bead50f59822eb0405"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2448.0.0-linux-x64.tar.gz"
    sha256 "b245771011cd46c67676d0d3480bac684e225492ab3d048fd2ca4985a0cd7bce"
  end
  version "2448.0.0"
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
