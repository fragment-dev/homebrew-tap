require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2919.0.0-darwin-x64.tar.gz"
    sha256 "c1590353fe17d5d2fc8d97d5ae2f5126cf5f21c18f33226f43574c0c220ac490"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2919.0.0-darwin-arm64.tar.gz"
      sha256 "70a53921a5e0c3eee5badece94dcae62babbb0755673f64828c6a374f89cd5c6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2919.0.0-linux-x64.tar.gz"
    sha256 "f567513f4912a0d6ff989499c93a8223def42a6a2cf755c3940a9c936e9d30f9"
  end
  version "2919.0.0"
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
