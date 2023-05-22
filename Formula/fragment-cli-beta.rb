require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2713.0.0-darwin-x64.tar.gz"
    sha256 "70a76fc08bbac32555a88216960f5c7bf905c5272406c0d025477a4970c23348"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2713.0.0-darwin-arm64.tar.gz"
      sha256 "9a23fa6ebd203c62128a7fbc800fdf00c4bd290ebeded96e6f410670ccdd3737"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2713.0.0-linux-x64.tar.gz"
    sha256 "b9ae628281225d8b6045ee2b3d889399d510fe0fe7a60ecad5d4cb87dd6144de"
  end
  version "2713.0.0"
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
