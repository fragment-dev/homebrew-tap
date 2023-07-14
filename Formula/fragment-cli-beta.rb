require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3066.0.0-darwin-x64.tar.gz"
    sha256 "302935ae2a995f9ad2034ae14ebdc4669e39c071e5848c2d68d5c5bb80cf775b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3066.0.0-darwin-arm64.tar.gz"
      sha256 "19c3680fd9fb472c936d16b9e1b1d7fb524fc6e7b862f2d123984519294cfeeb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3066.0.0-linux-x64.tar.gz"
    sha256 "5681be105c1fd7dd8e7ad199c9a77eda7d37d7e0c1446f78d0b276e2e73ca9a7"
  end
  version "3066.0.0"
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
