require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5806.0.0-darwin-x64.tar.gz"
    sha256 "d87a36016358bff48c6950822869739e1bf2e6722ac5ff7f52873ae42eaa59c0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5806.0.0-darwin-arm64.tar.gz"
      sha256 "39cf014029dad5356663c49f142b0d2e362b32d16ba96551be33004f9c7b5433"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5806.0.0-linux-x64.tar.gz"
    sha256 "4640e7c8c1e5c34768a3669bb41e837bd3c9f39e7cb09d7e96caa494367bf240"
  end
  version "5806.0.0"
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
