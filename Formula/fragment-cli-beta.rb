require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2796.0.0-darwin-x64.tar.gz"
    sha256 "459a7087da0458ada07e44131b2f86077015e8b71503a8ecaaa9beaeb75103cf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2796.0.0-darwin-arm64.tar.gz"
      sha256 "e77b2d7a7957d1086efc54a8bd06bff07c763bbb427458e3b213958159342b70"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2796.0.0-linux-x64.tar.gz"
    sha256 "c83d29b075e21ab133c35e3edcf8cd495aa9bfe2b6a837936d33793ab9659917"
  end
  version "2796.0.0"
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
