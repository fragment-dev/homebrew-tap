require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5629.0.0-darwin-x64.tar.gz"
    sha256 "99f92d06b0d298cf01390feaa606be55152ace09b9fc90e035cc0d0f09fcc7dc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5629.0.0-darwin-arm64.tar.gz"
      sha256 "2cc1ce2e7802ecfd93e3bab1e0f4cca8856260a4fcb3510fa839853fe3d282aa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5629.0.0-linux-x64.tar.gz"
    sha256 "4bdbba36f0ce986dd7eb7fd303743ce2d121fd4a7d2256c746127699c6f0bcda"
  end
  version "5629.0.0"
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
