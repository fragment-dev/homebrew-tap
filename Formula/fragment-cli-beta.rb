require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3862.0.0-darwin-x64.tar.gz"
    sha256 "b3b9daf07cc9a56624c75271bc8f1b7ee44e23959473fa397223c4b85066a880"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3862.0.0-darwin-arm64.tar.gz"
      sha256 "ace6a094a0e80d3543a8c23d193f1e65ab6f00efb5c4e7d6c5211e40d92ef43b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3862.0.0-linux-x64.tar.gz"
    sha256 "db145522d72987b29cda89c7b9419d94c56a94db2dca04b89a8e751ccdc9f734"
  end
  version "3862.0.0"
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
